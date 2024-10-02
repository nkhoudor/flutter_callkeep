import 'package:flutter_callkeep_platform_interface/src/models/callkeep_base_event.dart';

/// Holds the data for CallKeep call event
///
/// But it's also the data returned with multiple events in the package
class CallEvent extends CallKeepBaseEvent {
  /// Caller's name.
  final String? callerName;

  /// The handle of the caller (Phone number/Email/Any.)
  final String? handle;

  /// Whether the call has video or audio only
  final bool hasVideo;

  /// Incoming/Outgoing call display time (in seconds). If the time is over, the call will be missed.
  final double duration;

  /// Any data added to the event when received.
  final Map<String, dynamic>? extra;

  /// Whether call is accepted or not, defaults to false
  final bool isAccepted;

  /// The name of the app that is calling
  final String appName;

  /// Whether the call is outgoing or not
  final bool isOutgoing;

  CallEvent({
    required super.uuid,
    required this.isOutgoing,
    required this.appName,
    this.callerName,
    this.handle,
    this.hasVideo = false,
    this.isAccepted = false,
    this.duration = 180,
    this.extra,
  });

  factory CallEvent.fromMap(Map<String, dynamic> map) {
    return CallEvent(
      uuid: map['id'] ?? '',
      isOutgoing: map['isOutgoing'] ?? false,
      callerName: map['callerName'],
      handle: map['handle'],
      hasVideo: map['hasVideo'] ?? false,
      duration: map['duration']?.toDouble() ?? 180.0,
      isAccepted: map['isAccepted'] ?? false,
      appName: map['appName'] ?? '',
      extra: (map['extra'] as Map?)?.cast<String, dynamic>() ?? {},
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': uuid,
      'isOutgoing': isOutgoing,
      'callerName': callerName,
      'handle': handle,
      'hasVideo': hasVideo,
      'duration': duration,
      'isAccepted': isAccepted,
      'appName': appName,
      'extra': extra ?? {},
    };
  }

  CallEvent copyWith({
    bool? isOutgoing,
    String? callerName,
    String? handle,
    bool? hasVideo,
    bool? isAccepted,
    double? duration,
    String? appName,
    Map<String, dynamic>? extra,
  }) {
    return CallEvent(
      uuid: uuid,
      isOutgoing: isOutgoing ?? this.isOutgoing,
      callerName: callerName ?? this.callerName,
      handle: handle ?? this.handle,
      hasVideo: hasVideo ?? this.hasVideo,
      isAccepted: isAccepted ?? this.isAccepted,
      duration: duration ?? this.duration,
      appName: appName ?? this.appName,
      extra: extra ?? this.extra,
    );
  }

  @override
  String toString() {
    return 'CallEvent(uuid: $uuid, callerName: $callerName, handle: $handle, hasVideo: $hasVideo, duration: $duration, extra: $extra, isAccepted: $isAccepted, appName: $appName, isOutgoing: $isOutgoing)';
  }
}
