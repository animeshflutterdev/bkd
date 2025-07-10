import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../services/custom_widgets/error_route_widget.dart'
    deferred as error_route_widget;
import '../../services/helpers/logger_extension.dart';
import '../app_route_names.dart';
import '../app_router.dart';
import '../context_service.dart';
import 'web/custom_router_web.dart';

class CustomRoute {
  /// Manually navigating back always returns `[1]` as the default value in `[App]`,
  /// ensuring a consistent behavior across the application.
  /// If a `result` is provided, it will be used instead of `[1]` on non-web platforms.
  void back<T extends Object?>([T? result]) {
    assert(!kIsWeb || result == null,
        'Passing a result is not allowed on the web.');

    if (kIsWeb) {
      bool canBack = CustomRouterWeb().canBack();
      canBack
          ? CustomRouterWeb().back()
          : clearAndNavigate(AppRouteNames.initialRoot);
    } else {
      if (AppRouter.router.canPop() == true) {
        AppRouter.router.pop(result ?? 1);
      } else {
        clearAndNavigate(AppRouteNames.home);
      }
    }
  }

  void secBack() {
    back();
    back();
  }

  void clearAndNavigate(String name,
      {Map<String, String> pathParameters = const <String, String>{},
      Map<String, dynamic> queryParameters = const <String, dynamic>{},
      Object? extra}) {
    if (!kIsWeb) {
      AppRouter.router.goNamed(name,
          queryParameters: queryParameters,
          pathParameters: pathParameters,
          extra: extra);
    } else {
      if (CustomRouterWeb().historyIndex() != 0) {
        CustomRouterWeb().numBack(CustomRouterWeb().historyIndex());
      }
      Future.delayed(
          Duration(milliseconds: CustomRouterWeb().historyIndex() * 10), () {
        AppRouter.router.replaceNamed(name,
            queryParameters: queryParameters,
            pathParameters: pathParameters,
            extra: extra);
      });
    }
  }

  Future<MaterialPageRoute> _getRoute(
      {required String name, dynamic arguments}) async {
    switch (name) {
      /*case RouteName.productCartSearch:
        await product_cart_search.loadLibrary();
        return MaterialPageRoute(builder: (_) {
          return product_cart_search.ProductCartSearch();
        });
      case RouteName.paytm:
        await Future.wait(
            [paytm.loadLibrary(), error_route_widget.loadLibrary()]);
        return MaterialPageRoute(builder: (_) {
          if (arguments is PaytmMerchantDetails) {
            return paytm.PaytmUi(paytmMerchantDetails: arguments);
          } else {
            return error_route_widget.ErrorRouteWidget();
          }
        });
      case RouteName.rayzorpay:
        await Future.wait(
            [rayzorpay.loadLibrary(), error_route_widget.loadLibrary()]);
        return MaterialPageRoute(builder: (_) {
          if (arguments is RazorpayMerchantDetails) {
            return rayzorpay.RayzorPay(razorpayMerchantDetails: arguments);
          } else {
            return error_route_widget.ErrorRouteWidget();
          }
        });
      case RouteName.webViewPaymentGateway:
        await Future.wait([
          web_view_payment_gateway.loadLibrary(),
          error_route_widget.loadLibrary()
        ]);
        return MaterialPageRoute(builder: (_) {
          if (arguments is WebViewPaymentGatewayModel) {
            return web_view_payment_gateway.WebViewPaymentGateway(
                webViewPaymentGatewayModel: arguments);
          } else {
            return error_route_widget.ErrorRouteWidget();
          }
        });
      case RouteName.productImageScreen:
        await Future.wait([
          product_image_full_screen.loadLibrary(),
          error_route_widget.loadLibrary()
        ]);
        return MaterialPageRoute(builder: (_) {
          if (arguments is ProductImageFullScreenModel) {
            return product_image_full_screen.ProductImageFullScreen(
                productImageFullScreenModel: arguments);
          } else {
            return error_route_widget.ErrorRouteWidget();
          }
        });
      case RouteName.substituteReplace:
        await Future.wait([
          substitute_replace.loadLibrary(),
          error_route_widget.loadLibrary()
        ]);
        return MaterialPageRoute(builder: (_) {
          if (arguments is SubstituteReplaceModel) {
            return substitute_replace.SubstituteReplace(
                substituteReplaceModel: arguments);
          } else {
            return error_route_widget.ErrorRouteWidget();
          }
        });

      /// Genu :-
      case RouteName.labCartUploadPrescription:
        await genu_upload_prescription_cart.loadLibrary();
        return MaterialPageRoute(builder: (_) {
          return genu_upload_prescription_cart.GenuUploadPrescriptionCart(
            selectedFile: (arguments is List<CustomFile>) ? arguments : null,
          );
        });
      case RouteName.selectPreferTimeSlot:
        await Future.wait(
            [timeslot.loadLibrary(), error_route_widget.loadLibrary()]);
        return MaterialPageRoute(builder: (_) {
          if ((arguments is SlotUiInput) &&
              arguments.cartSyncResponse != null) {
            return timeslot.Timeslot(
              slotReturnDataModel: arguments.slotReturnDataModel,
              cartSyncResponse: arguments.cartSyncResponse!,
            );
          } else {
            return error_route_widget.ErrorRouteWidget();
          }
        });
      case RouteName.labCartPromoCode:
        await genu_promocode.loadLibrary();
        return MaterialPageRoute(builder: (_) {
          return genu_promocode.GenuPromoCode(
              appliedPromoCode: arguments is String ? arguments : null);
        });
      case RouteName.error:
        await Future.wait(
            [crash_ui.loadLibrary(), error_route_widget.loadLibrary()]);
        return MaterialPageRoute(builder: (_) {
          if (arguments is Map<String, dynamic>) {
            return crash_ui.CrashUi(errorDetails: arguments);
          } else {
            return error_route_widget.ErrorRouteWidget();
          }
        });*/
      default:
        await error_route_widget.loadLibrary();
        return MaterialPageRoute(builder: (_) {
          return error_route_widget.ErrorRouteWidget();
        });
    }
  }

  Future pushNamed({required String name, dynamic arguments}) async {
    final route = await _getRoute(name: name, arguments: arguments);
    return await Navigator.push(CurrentContext().context, route);
  }

  String? currentRoute() {
    try {
      final RouteMatch lastMatch =
          AppRouter.router.routerDelegate.currentConfiguration.last;
      final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
          ? lastMatch.matches
          : AppRouter.router.routerDelegate.currentConfiguration;
      final String location = matchList.uri.toString();
      return location;
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
    return null;
  }

  Future<void> goto({
    required String routeName,
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) async {
    GoRouter router = AppRouter.router;
    if (kIsWeb) {
      router.goNamed(routeName,
          pathParameters: pathParameters,
          queryParameters: queryParameters,
          extra: extra);
    } else {
      await router.pushNamed(routeName,
          pathParameters: pathParameters,
          queryParameters: queryParameters,
          extra: extra);
    }
  }
}
