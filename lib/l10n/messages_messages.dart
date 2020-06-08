// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a messages locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'messages';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "advanced" : MessageLookupByLibrary.simpleMessage("Advanced"),
    "begginer" : MessageLookupByLibrary.simpleMessage("Begginer"),
    "details" : MessageLookupByLibrary.simpleMessage("Details"),
    "gender" : MessageLookupByLibrary.simpleMessage("Gender"),
    "height" : MessageLookupByLibrary.simpleMessage("Height"),
    "intermediate" : MessageLookupByLibrary.simpleMessage("Intermediate"),
    "level" : MessageLookupByLibrary.simpleMessage("Level"),
    "profile" : MessageLookupByLibrary.simpleMessage("Profile"),
    "text1" : MessageLookupByLibrary.simpleMessage("The begginers guide is for those that workout once a week."),
    "text2" : MessageLookupByLibrary.simpleMessage("The intermediate guide is for those that workout 2 or 3 times a week."),
    "text3" : MessageLookupByLibrary.simpleMessage("The advanceded guide is for those that workout 4 to 6 times a week."),
    "weight" : MessageLookupByLibrary.simpleMessage("Weight"),
    "welcome" : MessageLookupByLibrary.simpleMessage("Welcome")
  };
}
