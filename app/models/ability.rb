# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.admin?
      can :manage, :all
    else
      can :read, :all # permisos para leer cualquier modelo
      can :create, Report # puede crear reportes
      can :update, Report, user_id: user.id # puede actualizar solo sus reportes

      can :create, Incident # puede crear incidentes
      can :update, Incident, user_id: user.id # puede actualizar solo sus incidentes

      # Especificar más habilidades según sea necesario
    end
  end
end
