class GenerateTrivium

  attr_accessor :data

  def self.generate!(data)
    g = self.new
    g.data = data
    g.create
  end

  def create
    trivium
    questions
    return {success: true}
  end

  def questions
    self.data[:questions].each do |qt|
      question = trivium.questions.new
      question.language_id = trivium.language_id
      question.question = qt[:question]
      question.answer_corrects = qt[:answer_corrects]
      question.save
      qt[:answers].each do |a|
        answer = question.answers.new
        answer.language_id = trivium.language_id
        answer.answer = set_answer(a[:answer],a[:type_answer],"#{Time.new.to_i}-#{question.id}")
        answer.correct = a[:correct] ||= false
        answer.type_answer = a[:type_answer]
        answer.save
      end
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
    @urlImg = ConnectAws.upload_image({file: base64,path: 'app-sales/files',key: name,contentType: "image/png"})
  end

  def trivium
    @trivium ||= create_t
  end

  def create_t
    t = Trivium.new
    t.name = self.data[:triviums][:name]
    t.initial_date = self.data[:triviums][:initial_date]
    t.finish_date = self.data[:triviums][:finish_date]
    t.category_id = self.data[:triviums][:category_id]
    t.status = set_status
    t.description = self.data[:triviums][:description]
    t.dt_h = self.data[:triviums][:dt_h]
    t.dt_min = self.data[:triviums][:dt_min]
    t.language_id = self.data[:triviums][:language_id]
    t.user_id = self.data[:triviums][:user_id]
    t.save
    t
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