class ContentTypeValidator < ActiveModel::Validator
  def validate(record)
    unless record.document.nil?
      first_revision = record.document.revisions.all.last
      unless first_revision.nil?
        if first_revision.content_type != record.content_type
          record.errors[:base] << "The new revision must be the same type of file as the existing document"
        end
      end
    end
  end
end