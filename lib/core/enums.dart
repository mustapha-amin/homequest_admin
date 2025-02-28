import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

enum SideMenuItem {
  dashboard('Dashboard', Iconsax.grid_2),
  users('Users', Iconsax.user),
  property_listings('Property Listings', Iconsax.home),
  reports('Reports', Iconsax.note),
  settings('Settings', Iconsax.setting);

  final String name;
  final IconData icon;

  const SideMenuItem(this.name, this.icon);
}

enum ListingType { rent, sale }

enum UserType { agent, client }

enum PropertyType {
  all,
  apartment,
  mansion,
  bungalow,
  duplex,
}

enum Status {
  initial,
  loading,
  success,
  error,
}


enum Furnishing {
  unfurnished('unfurnished'),
  semi_furnished('semi furnished'),
  furnished('furnished');

  final String name;

  const Furnishing(this.name);
}

enum Condition {
  all('all'),
  old('old'),
  newly_built('newly built'),
  renovated('renovated');

  final String name;

  const Condition(this.name);
}

enum PropertySubtype {
  all('all'),
  detached('detached'),
  semi_detached('semi detached');

  final String name;

  const PropertySubtype(this.name);
}

enum Facility {
  prepaid_meter("Prepaid meter"),
  pop_ceiling("POP ceiling"),
  tiled_floor("Tiled floor"),
  wardrobe('Wardrobe'),
  balcony('Balcony'),
  running_water('Running water'),
  parking_space('Parking space'),
  electricity("Electricity");

  final String name;

  const Facility(this.name);
}

enum Feature {
  bedrooms("Bedrooms"),
  bathrooms("Bathrooms"),
  kitchens("Kitchens"),
  sitting_rooms("Sitting rooms");

  final String name;

  const Feature(this.name);
}