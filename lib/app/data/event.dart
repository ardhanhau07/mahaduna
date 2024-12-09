class Event {
  final int eventId;
  final String category;
  final String eventName;
  final String imageURL;
  bool isFavorated;
  final String decription;
  bool isSelected;

  Event(
      {required this.eventId,
      required this.category,
      required this.eventName,
      required this.imageURL,
      required this.isFavorated,
      required this.decription,
      required this.isSelected});

  //List of Events data
  static List<Event> EventList = [
    Event(
        eventId: 0,
        category: 'Bahasa',
        eventName: 'Gebyar Bahasa',
        imageURL: 'assets/images/asset_bahasa.png',
        isFavorated: false,
        decription:
            'This Event is one of the best Event. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false),
    Event(
        eventId: 1,
        category: 'Maulid',
        eventName: 'Kesantrian',
        imageURL: 'assets/images/maulid.png',
        isFavorated: false,
        decription:
            'This Event is one of the best Event. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false),
    Event(
        eventId: 2,
        category: 'K3O Cup',
        eventName: 'K3O',
        imageURL: 'assets/images/k3o.png',
        isFavorated: false,
        decription:
            'This Event is one of the best Event. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false),
    Event(
        eventId: 3,
        category: 'Moderasi Beragama',
        eventName: 'Kesantrian',
        imageURL: 'assets/images/moderasi.png',
        isFavorated: false,
        decription:
            'This Event is one of the best Event. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false),
    Event(
        eventId: 4,
        category: 'Senam Bersama',
        eventName: 'Kesantrian',
        imageURL: 'assets/images/senam.png',
        isFavorated: true,
        decription:
            'This Event is one of the best Event. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false),
  ];

  //Get the favorated items
  static List<Event> getFavoritedEvents() {
    List<Event> travelList = Event.EventList;
    return travelList.where((element) => element.isFavorated == true).toList();
  }

  //Get the cart items
  static List<Event> addedToCartEvents() {
    List<Event> selectedEvents = Event.EventList;
    return selectedEvents
        .where((element) => element.isSelected == true)
        .toList();
  }
}
