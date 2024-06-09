import 'package:flutter/material.dart';
import 'package:todo/application/core/extensions/extensions.dart';
import 'package:todo/ui/base/base_state.dart';
import 'package:todo/widgets/custom_loader.dart';

class LoadingOverLay extends StatelessWidget {
  const LoadingOverLay({Key? key, required this.loadingState, required this.child}) : super(key: key);
  final BaseLoadingState loadingState;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (loadingState == BaseLoadingState.loading)
          AbsorbPointer(
            absorbing: true,
            child: Container(
              color: Colors.black12,
              height: context.height,
              width: context.width,
            ),
          ),
        if (loadingState == BaseLoadingState.loading)
          const Center(
              child: FlickrLoader(
            overLay: false,
          )),
      ],
    );
  }
}
