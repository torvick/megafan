class EditTrivium

  attr_accessor :data

  def self.generate!(data)
    g = self.new
    g.data = data
    g.create
  end

  def create
    update_trivium
    update_questions
    return {success: true}
  end

  def update_questions
    self.data[:questions].each do |qt|
      question = trivium.questions.find(qt[:id])
      question.language_id = trivium.language_id
      question.question = qt[:question]
      question.answer_corrects = qt[:answer_corrects]
      question.save
      qt[:answers].each do |a|
        answer = set_question(question,a[:id])
        answer.language_id = trivium.language_id
        answer.answer = set_answer(a[:answer],a[:type_answer],"#{Time.new.to_i}-#{question.id}")
        answer.correct = a[:correct] ||= false
        answer.type_answer = a[:type_answer]
        answer.save
      end
    end
  end

  def set_question(question,id)
    if id.present?
      question.answers.find(id)
    else
      question.answers.new
    end
  end

  def set_answer(answer,type,name)
    case type
    when 'text'
      answer
    when 'bool'
      answers
    when 'img'
      save_image(answer,name)
    end
  end

  def save_image(base64,name)
    if base64.include?('https://')
      @urlImg = base64
    else
      @urlImg = ConnectAws.upload_image({file: base64,path: 'app-sales/files',key: name,contentType: "image/png"})
    end
    @urlImg
  end

  def trivium
    @trivium ||= Trivium.find(self.data[:id])
  end

  def update_trivium
    trivium.name = self.data[:triviums][:name]
    trivium.initial_date = self.data[:triviums][:initial_date]
    trivium.finish_date = self.data[:triviums][:finish_date]
    trivium.category_id = self.data[:triviums][:category_id]
    trivium.status = set_status
    trivium.description = self.data[:triviums][:description]
    trivium.dt_h = self.data[:triviums][:dt_h]
    trivium.dt_min = self.data[:triviums][:dt_min]
    trivium.language_id = self.data[:triviums][:language_id]
    trivium.user_id = self.data[:triviums][:user_id]
    trivium.save
  end

  def set_status
    case self.data[:triviums][:status]
    when '0'
      'inactived'
    when '1'
      'actived'
    end
  end

end