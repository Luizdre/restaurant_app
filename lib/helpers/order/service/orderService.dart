// ignore_for_file: prefer_collection_literals, unnecessary_new, file_names
import 'package:dio/dio.dart';
import 'package:restaurant/helpers/const/url.dart';
import 'package:restaurant/helpers/order/model/orderModel.dart';

class OrderService {
  final Dio dio = Dio();
  final String orderUrl = '$BASE_URL/order';
  OrderModel order = OrderModel();

  Future<List<OrderModel>> getOrders(DateTime time) async {
    Response response = await dio.get('$orderUrl/listOrders');

    List transform = response.data;
    List<OrderModel> orders = [];

    // ignore: avoid_function_literals_in_foreach_calls
    transform.forEach((element) {
      orders.add(OrderModel(
          id: element['_id'],
          clientName: element['clientName'],
          totalPrice: double.tryParse(element['totalPrice'].toString()),
          products: element['products'],
          obs: element['obs'],
          payment: element['payment'],
          status: element['status'],
          payd: element['payd'],
          createdAt: DateTime.tryParse(element['createdAt'])));
    });
    orders.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
    orders = orders.where((element) => element.payd == false).toList();
    return orders;
  }

  Future<OrderModel> toggleStatus(OrderModel order) async {
    Response response = await dio.patch('$orderUrl/acceptOrder',
        data: {'id': order.id, 'status': order.status});
    return response.data;
  }

  Future sendOrder(OrderModel order) async {
    Response response = await dio.post('$orderUrl/sendOrder', data: {
      'clientName': order.clientName,
      'totalPrice': order.totalPrice,
      'products': order.products,
      'obs': order.obs,
      'payment': order.payment,
    });
    return response.data;
  }
}
