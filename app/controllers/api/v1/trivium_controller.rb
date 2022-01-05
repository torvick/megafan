class Api::V1::TriviumController < Api::V1::BaseController

  def index
    triviums = Trivium.all.as_json(include: [
                                              language: {only: [:name,:value,:description]},
                                              category: {only: [:name,:value,:description]}
                                            ])
    response_method(true, triviums)
    response = ResponsesEngine.build!(params)
    return render json: response, status: response[:code]
  end

  def show
    triviums = Trivium.find_by(id: params[:id])
                      .as_json(include: [
                                          language: {only: [:name,:value,:description]},
                                          category: {only: [:name,:value,:description]},
                                          questions: { include: [answers: {only: [:id,:answer,:correct,:type_answer]} ],
                                                       only: [:id,:answer_corrects,:question]
                                                     }
                                        ])
    response_method(true, triviums)
    response = ResponsesEngine.build!(params)
    return render json: response, status: response[:code]
  end

end
