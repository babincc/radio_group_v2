/// Deprecated legacy radio groups. Prefer radio_group_builder:
/// https://pub.dev/packages/radio_group_builder.
///
/// Existing applications can continue using this API. On recent Flutter,
/// hide Flutter's RadioGroup import or prefix this package to avoid collisions.
library;

// @author Christian Babin
// @version 3.3.2
// https://github.com/babincc/radio_group_v2/blob/master/lib/radio_group_v2.dart

export 'package:radio_group_v2/exceptions/controller_decoupled_exception.dart';
export 'package:radio_group_v2/exceptions/illegal_value_exception.dart';
export 'package:radio_group_v2/exceptions/index_out_of_bounds_exception.dart';
export 'package:radio_group_v2/exceptions/invalid_key_type_exception.dart';
export 'package:radio_group_v2/exceptions/multiple_radio_group_exception.dart';
export 'package:radio_group_v2/utils/radio_group_decoration.dart';
export 'package:radio_group_v2/widgets/view_models/radio_group_controller.dart';
export 'package:radio_group_v2/widgets/views/radio_group.dart';
