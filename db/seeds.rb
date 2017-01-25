EXTERNALS = [1, 2, 3]
PANEL_CODES = %w(test1 test2 test3)
COUNTRIES = %w(EN UA PL)
LOCATIONS = %w(
  Gdansk Beloyarskiy Georgia Krasnojarsk Krasnodar Florida
  North-street Camptown Downtown Chinatown Chelm Munich Cherkassy Warsaw
  California Kiyev Moscow Tremptown Wroclaw Connecticut
)

# Create Api key

ApiKey.where(key: "929c3033b82be6053dc8d9d5fbcd8073").first_or_create!

# Create 3 panel providers

PANEL_CODES.each do |code|
  PanelProvider.where(code: code).first_or_create!
end

# create 3 countries

PanelProvider.find_each.with_index do |provider, index|
  country_code = COUNTRIES[index]
  Country.where(
    country_code: country_code,
    panel_provider: provider
  ).first_or_create!
end

# create 20 locations

LOCATIONS.each do |name|
  location = Location.where(name: name).first_or_initialize(
    secret_code: SecureRandom.hex
  )
  location.save!
  location.update(external_id: location.id)
end

# create 3 different location groups

PanelProvider.find_each.with_index do |provider, index|
  location_group =
    LocationGroup.where(panel_provider: provider).first_or_initialize(
      name: "test_group_#{index}",
      country: Country.order("RANDOM()").take,
      locations: Location.order("RANDOM()").take(1)
    )
  location_group.save!
end

# create location group which is belong to same provider

location_group = LocationGroup.last
location_duplicated =
  LocationGroup.where(
    panel_provider: location_group.panel_provider
  ).where.not(name: location_group.name).first_or_initialize(
    name: "test_group_4",
    country: Country.order("RANDOM()").take,
    locations: Location.order("RANDOM()").take(1)
  )
location_duplicated.save!

# associate every location with location groups

Location.find_each do |location|
  location.update(location_groups: LocationGroup.order("RANDOM()").take(1))
end

# create 3 root target groups

PanelProvider.find_each.with_index do |provider, index|
  target_group =
    TargetGroup.where(panel_provider: provider).first_or_initialize(
      name: "test_group_#{index}",
      countries: Country.order("RANDOM()").take(1),
      secret_code: SecureRandom.hex
    )
  target_group.save!
  target_group.update(external_id: target_group.id)
end

# create root target_group which is belong to same provider

target_group = TargetGroup.last
target_duplicated =
  TargetGroup.where(
    panel_provider: target_group.panel_provider
  ).where.not(name: target_group.name).first_or_initialize(
    name: "test_group_4",
    countries: Country.order("RANDOM()").take(1),
    secret_code: SecureRandom.hex
  )
target_duplicated.save!
target_duplicated.update(external_id: target_duplicated.id)

# Create target subgroups

TargetGroup.where(parent: nil).find_each.with_index do |target, index|
  3.times do |subindex|
    target_group =
      TargetGroup.where(
          parent: target,
          name: "test_subgroup_#{index}_#{subindex}"
      ).first_or_initialize(
        panel_provider: target.panel_provider,
        name: "test_subgroup_#{index}_#{subindex}",
        countries: Country.order("RANDOM()").take(1),
        secret_code: SecureRandom.hex
      )
    target_group.save!
    target_group.update(external_id: target_group.id)
  end
end
