import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wikipediaapp/ui/viewmodels/basemodel.dart';

import '../../locator.dart';


class BaseView<T extends BaseModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget child) builder;
  final Function(T) onModelReady;
  const BaseView({Key key, this.builder, this.onModelReady, this.onModelReload}) : super(key: key);
  // It did worked! Yeah!!!
  final Function(T) onModelReload;
  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseModel> extends State<BaseView<T>> {
  T model = locator<T>();

  @override
  void initState() {
    if(widget.onModelReady != null){
      widget.onModelReady(model);
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // It did worked! Yeah!!!
    if(widget.onModelReload!=null) {
      widget.onModelReload(model);
    }
    return ChangeNotifierProvider<T>(
        builder: (context) => model,
        child: Consumer<T>(builder:  widget.builder));
  }
}
