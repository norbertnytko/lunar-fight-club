class FighterDecorator < BaseDecorator
  def name
    last_name ? "#{first_name} #{last_name}" : "#{first_name}"
  end
end
