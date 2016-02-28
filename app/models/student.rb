class Student < ActiveRecord::Base
  attr_accessor :avatar_file_name
  has_secure_password

  has_many :my_projects
  has_many :projects, through: :my_projects
  has_many :partnerships, through: :my_projects

  validates :name, presence: true
  validates :cohort, presence: true
  validates :username, presence: true
  validates :password_digest, presence: true

  has_attached_file :avatar, styles: {
    favicon: '16x16>',
    square: '200x200#',
    medium: '300x300>'
  },
  :s3_credentials => {
    :bucket => ENV['S3_BUCKET_NAME'],
    :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
    :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
  }


  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  enum role: %w(default admin)

  def paired
    my_projects.map do |project|
      MyProject.where(partnership_id: project.partnership_id).map do |partner_project|
        partner_project.student.name
      end
    end.flatten.uniq.delete_if { |name| name == self.name }
  end

  def unpaired
    Student.all.select do |student|
      !paired.include?(student.name)
    end.map do |non_pair|
      non_pair.name
    end.delete_if { |name| name == self.name }
  end
end
