library;
import 'dart:math';
import 'package:flutter/rendering.dart';
import 'package:homequest_admin/core/utils/appcolor.dart';
import 'package:syncfusion_flutter_charts/charts.dart' as syncf;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homequest_admin/core/enums.dart';
import 'package:homequest_admin/core/extensions.dart';
import 'package:homequest_admin/core/utils/textstyle.dart';
import 'package:homequest_admin/models/agents.dart';
import 'package:homequest_admin/models/client.dart';
import 'package:homequest_admin/models/property_listing.dart';
import 'package:homequest_admin/services/user_data.dart';
import 'package:homequest_admin/widgets/dashboard_tile.dart';
import 'package:homequest_admin/widgets/property_listing_widget.dart';
import 'package:homequest_admin/widgets/segmented_bttn.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:skeletonizer/skeletonizer.dart';

part 'main_dashboard.dart';
part 'properties.dart';
part 'settings.dart';
part 'users.dart';
