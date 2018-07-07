class TitlesController < ApplicationController

  def show
    title_id = params[:id]
    title = Title.find_by_id(title_id)
    include_types = params[:include] ? params[:include].split(',') : []

    # Handle: ID doesn't match a Title.
    if title.nil?
      return render_error('not_found', 404)
    end

    # Handle: requested inclusion can not be accomplished.
    if !include_types.empty? && include_types != ['offers']
      return render_error('unknown_include', 400)
    end

    # Load the list of requested includes.
    includes = []

    if include_types.include?('offers')
      offers = title[:offers].map { |offer_id| Offer.find_by_id(offer_id) }
      includes << [:offer, offers]
    end

    # Create response body.
    response_body = TitleSerializer.serialize(title, includes)

    render json: response_body, status: 200
  end

end
