class User < ApplicationRecord

  # 2 types of users:
  has_many :attends_event, foreign_key: 'participant_id', class_name: 'User'
  has_many :organizes_event, foreign_key: 'admin_id', class_name: 'User' 

  #Participant
  has_many :attendances

  #Admin
  has_many :events

  # callback qui permet juste après l'inscription en base d'un nouvel utilisateur, 
  # d'appeler la méthode d'instance welcome_send. Celle-ci ne fait qu'appeler le 
  # mailer UserMailer en lui faisant exécuter welcome_email avec, pour seule 
  # entrée, l'instance créée (d'où le self).
  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  
end
