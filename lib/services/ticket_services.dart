part of 'services.dart';

class TicketServices {
  static CollectionReference ticketCollection =
      FirebaseFirestore.instance.collection('tickets');

  static Future<void> saveTicket(String? id, Ticket ticket) async {
    await ticketCollection.doc().set({
      'movieID': ticket.movieDetail.id ?? "",
      'userID': id ?? "",
      'theaterName': ticket.theater.name ?? 0,
      'time': ticket.time.millisecondsSinceEpoch,
      'bookingCode': ticket.bookingCode,
      'seats': ticket.seatsInString,
      'name': ticket.name,
      'totalPrice': ticket.totalPrice
    });
  }

  static Future<List<Ticket>> getTickets(String userId) async {
    QuerySnapshot snapshot = await ticketCollection.get();
    var documents = snapshot.docs.where((document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      return data['userID'] == userId;
    });

    List<Ticket> tickets = [];
    for (var document in documents) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      MovieDetail movieDetail =
          await MovieServices.getDetails(null, movieID: data['movieID']);
      tickets.add(Ticket(
          movieDetail,
          Theater(data['theaterName']),
          DateTime.fromMillisecondsSinceEpoch(data['time']),
          data['bookingCode'],
          data['seats'].toString().split(','),
          data['name'],
          data['totalPrice']));
    }

    return tickets;
  }
}
