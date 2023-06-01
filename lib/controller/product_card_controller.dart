import 'package:flutter/widgets.dart';
import 'package:hyah_karima/data/external/fav_external.dart';

class ProductCardController extends ChangeNotifier {
  ProductCardController(String productId) {
    _productId = productId;
    checkIsFavValue().then((value) => notifyListeners());

    debugPrint('ProductCardController');
  }
  String _productId = '';
  bool _isFav = false;
  bool get isFav => _isFav;

  checkIsFavValue() async {
    _isFav = await FavExternalDataBase.instance.checkFav(_productId);
  }

  void addToFav() async {
    var res = await FavExternalDataBase.instance.addFav(_productId);
    _isFav = res;
    notifyListeners();
  }

  void deleteFav() async {
    var res = await FavExternalDataBase.instance.deleteFav(_productId);
    _isFav = !res;
    notifyListeners();
  }

  void favAction() {
    if (_isFav) {
      deleteFav();
    } else {
      addToFav();
    }
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint('ProductCardController dispose');
  }
}
