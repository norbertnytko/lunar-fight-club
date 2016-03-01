module FightersHelper
  def fighters_collection
    Fighter.all.map { |r| [ r.decorate.name, r.id ]}
  end
end
