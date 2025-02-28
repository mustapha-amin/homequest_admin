import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homequest_admin/models/property_listing.dart';

class PropertyListingWidget extends ConsumerStatefulWidget {
  final PropertyListing propertyListing;
  const PropertyListingWidget({required this.propertyListing, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PropertyListingWidgetState();
}

class _PropertyListingWidgetState extends ConsumerState<PropertyListingWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            widget.propertyListing.imagesUrls[0],
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(height: 10),
        
      ],
    );
  }
}
