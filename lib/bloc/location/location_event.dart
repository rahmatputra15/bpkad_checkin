abstract class LocationEvent {}

class GetLocationEvent extends LocationEvent {}

class WatchLocationEvent extends LocationEvent {
  /// Start listening to real-time location updates from geolocation stream
}

class StopWatchingLocationEvent extends LocationEvent {
  /// Stop listening to location updates
}
