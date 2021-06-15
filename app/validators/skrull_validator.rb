class SkrullValidator < ActiveModel::Validator
  def validate(record)
    if record.name.downcase.include? "skrull"
      record.errors.add :name, "This person is a Skrull"
    end
  end
end
