class AssessmentsController < ApplicationController
  skip_before_filter :verify_authenticity_token, if: Proc.new { |c|
    c.request.params[:action] == "update"
  }

  # Selecting a deck is the only requirement for creating a new assessment
  # so here it is best to providing a list of available decks.
  def new
    @decks = Traitify.new.decks.map { |deck| [deck.name, deck.id] }
  end

  # Create a new assessment and then render the show page
  def create
    redirect_to edit_assessment_path(assessment.id)
  end

  # Present the slides for the assessment
  def edit
    @assessment_id = params[:id]
    @slides = Traitify.new.find_slides(@assessment_id)
  end

  # Update the slides for an assessment
  def update
    begin
      Traitify.new.update_slide(params[:id], {
        id:         params[:slide],
        response:   params[:answer],
        time_taken: 1000
      })
    rescue
      [500, 'Error updating slide']
    end
    render nothing: true
  end

  # If the assessment is complete then we show the results.
  def show
    traitify = Traitify.new
    @assessment_id = params[:id]
    assessment = traitify.find_assessment(@assessment_id)

    if assessment.completed_at
      @results = traitify.find_results(@assessment_id)
    end
  end

  def assessment
    Traitify.new.create_assessment(deck_id: params[:deck])
  end
  hide_action :assessment
end
