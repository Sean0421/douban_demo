
import 'package:shoppingMall/ui/widget/shared/size_fit.dart';

extension DoubleFit on double {
  double get px{
    return HYSizefit.setPx(this);
  }

  double get rpx{
    return HYSizefit.setRpx(this);
  }
}