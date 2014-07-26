class CreateDefaultStatuses
  def call
    Status.new(name: "New", order: 1, is_final: false).save!
    Status.new(name: "Initial Contact", order: 2, is_final: false).save!
    Status.new(name: "Visiting", order: 3, is_final: false).save!
    Status.new(name: "Visiting Additional", order: 4, is_final: false).save!
    Status.new(name: "Found Group", order: 5, is_final: false).save!
    Status.new(name: "Follow Up", order: 6, is_final: false).save!
    Status.new(name: "Connected", order: 7, is_final: true).save!
    Status.new(name: "Not Connected", order: 8, is_final: true).save!
  end
end