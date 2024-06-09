import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:todo/application/core/failure/failure.dart';
import 'package:todo/application/core/result.dart';
import 'package:todo/application/main_config/routes/route_import.dart';
import 'package:todo/constant/app_strings.dart';
import 'package:todo/constant/constants.dart';
import 'package:todo/data/models/todo/todo_model.dart';
import 'package:todo/domain/entities/add_todo.dart';
import 'package:todo/domain/entities/delete_entity.dart';
import 'package:todo/domain/entities/update_todo.dart';
import 'package:todo/provider/todo_view_model.dart';
import 'package:todo/ui/base/base_widget.dart';
import 'package:todo/widgets/app_bar.dart';
import 'package:todo/widgets/base_scaffold.dart';
import 'package:todo/widgets/big_btn.dart';

class TodoScreen extends BaseStateFullWidget {
  final String userId;
  TodoScreen({super.key, required this.userId});

  @override
  State<TodoScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<TodoScreen> implements Result {
  final int _pagelimit = 10;

  final PagingController<int, Todos> _pagingController = PagingController(firstPageKey: 0);

  @override
  void initState() {
    Future.microtask(() => context.read<TodoViewModel>().init(this));

    super.initState();
    // _pagingController.addPageRequestListener((pageKey) {
    //   SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
    //     if (mounted) {
    //       _fetchPage(pageKey);
    //     }
    //   });
    // });
  }

  // This method set the new index to the element.
  void reorderData(int oldindex, int newindex) async {
    final todoViewModel = context.read<TodoViewModel>().todoModel;

    setState(() {
      if (newindex > oldindex) {
        newindex -= 1;
      }
      final items = todoViewModel.todos?.removeAt(oldindex);
      todoViewModel.todos?.insert(newindex, items ?? Todos());
    });
  }

  // Future<void> _fetchPage(int pageKey) async {
  //   try {
  //     final newItems = await context.read<TodoViewModel>().fetchTodo(TodoEntity(limit: _pagelimit.toString(), skip: "2"));
  //     final isLastPage = newItems.length < _pagelimit;
  //     if (isLastPage) {
  //       _pagingController.appendLastPage(newItems);
  //     } else {
  //       final nextPageKey = pageKey + newItems.length;
  //       _pagingController.appendPage(newItems, nextPageKey);
  //     }
  //   } catch (error) {
  //     _pagingController.error = error;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final todoViewModel = context.watch<TodoViewModel>().todoModel;

    return BaseScaffoldWithBaseContainer(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Style.blueColor,
        child: const Icon(Icons.add, color: Style.whiteColor),
        onPressed: () {
          context.read<TodoViewModel>().addTodo(AddTodoEntity(todo: "todo add 1", completed: true, userId: "1"), this);
        },
      ),
      scroll: true,
      padding: const EdgeInsets.all(20),
      appBar: AppBarWidget(
        title: AppStrings.post,
        leading: IconButton(onPressed: () => navigator?.pop(), icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.dimens.k100.verticalBoxPadding(),
          // PagedListView<int, Todos>.separated(
          //   shrinkWrap: true,
          //   primary: true,
          //   physics: NeverScrollableScrollPhysics(),
          //   pagingController: _pagingController,
          //   builderDelegate: PagedChildBuilderDelegate<Todos>(
          //       itemBuilder: (context, item, index) => GestureDetector(
          //             onTap: () {
          //               Navigator.pushNamed(context, RoutePath.profileScreen, arguments: item);
          //             },
          //             child: Column(
          //               mainAxisAlignment: MainAxisAlignment.start,
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Container(
          //                   height: 100.0,
          //                   color: Colors.transparent,
          //                   child: Container(
          //                       padding: const EdgeInsets.all(18.0),
          //                       decoration: const BoxDecoration(
          //                           gradient: LinearGradient(
          //                             begin: Alignment.centerRight,
          //                             end: Alignment.centerLeft,
          //                             colors: [
          //                               Color(0xFF0E589B),
          //                               Color(0xFF0287E4),
          //                             ],
          //                           ),
          //                           borderRadius: BorderRadius.all(
          //                             Radius.circular(10.0),
          //                           )),
          //                       child: Column(
          //                         mainAxisAlignment: MainAxisAlignment.start,
          //                         crossAxisAlignment: CrossAxisAlignment.start,
          //                         children: [
          //                           Row(
          //                             mainAxisAlignment: MainAxisAlignment.start,
          //                             crossAxisAlignment: CrossAxisAlignment.start,
          //                             children: [
          //                               const Text("Title: ", style: TextStyle(color: Style.whiteColor)),
          //                               Expanded(
          //                                 flex: 1,
          //                                 child: Text(
          //                                   item.todo ?? 'No Data',
          //                                   style: const TextStyle(color: Style.whiteColor),
          //                                   overflow: TextOverflow.ellipsis,
          //                                 ),
          //                               ),
          //                             ],
          //                           ),
          //                           const SizedBox(height: 10),
          //                           Row(
          //                             mainAxisAlignment: MainAxisAlignment.start,
          //                             crossAxisAlignment: CrossAxisAlignment.start,
          //                             children: [
          //                               const Text("Body: ", style: TextStyle(color: Style.whiteColor)),
          //                               Expanded(
          //                                 flex: 1,
          //                                 child: Text(
          //                                   item.todo ?? 'No Data',
          //                                   style: const TextStyle(color: Style.whiteColor),
          //                                   overflow: TextOverflow.ellipsis,
          //                                   maxLines: 2,
          //                                 ),
          //                               ),
          //                             ],
          //                           ),
          //                         ],
          //                       )),
          //                 ),
          //               ],
          //             ),
          //           ),
          //       firstPageProgressIndicatorBuilder: (_) => const SizedBox()),
          //   separatorBuilder: (context, index) => widget.dimens.k10.verticalBoxPadding(),
          // ),
          ReorderableListView(
            shrinkWrap: true,
            primary: true,
            onReorder: reorderData,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              for (final todos in todoViewModel.todos ?? <Todos>[])
                Card(
                  color: Colors.white,
                  key: ValueKey(todos),
                  elevation: 2,
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.pushNamed(context, RoutePath.profileScreen, arguments: todos);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: Colors.transparent,
                          child: Container(
                              padding: const EdgeInsets.all(18.0),
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.centerRight,
                                    end: Alignment.centerLeft,
                                    colors: [
                                      Color(0xFF0E589B),
                                      Color(0xFF0287E4),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  )),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text("Title: ", style: TextStyle(color: Style.whiteColor)),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          todos.todo ?? '',
                                          style: const TextStyle(color: Style.whiteColor),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text("Body: ", style: TextStyle(color: Style.whiteColor)),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          todos.todo ?? 'No Data',
                                          style: const TextStyle(color: Style.whiteColor),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        child: BigBtn(
                                          radius: 4,
                                          color: Style.blueColor,
                                          onTap: () async {
                                            context.read<TodoViewModel>().deleteTodo(DeleteTodoEntity(userId: todos.id.toString()), this);
                                          },
                                          child: const Text(
                                            // AppStrings.loginButtonText.toUpperCase(),
                                            "Delete",
                                            style: TextStyle(fontSize: 16, color: Style.whiteColor),
                                          ),
                                        ),
                                      ),
                                      widget.dimens.k10.horizontalBoxPadding(),
                                      Expanded(
                                          child: BigBtn(
                                        radius: 12,
                                        color: Style.blueColor,
                                        onTap: () async {
                                          widget.navigator.showBottomSheet(child: UpdateBottomSheet(
                                            onTap: (value) {
                                              widget.navigator.pop();
                                              context.read<TodoViewModel>().updateTodo(
                                                  UpdateTodoEntity(todo: value, userId: todos.userId.toString(), id: todos.id, completed: true),
                                                  this);
                                            },
                                          ));
                                        },
                                        child: const Text(
                                          // AppStrings.loginButtonText.toUpperCase(),
                                          "Update",
                                          style: TextStyle(fontSize: 16, color: Style.whiteColor),
                                        ),
                                      ))
                                    ],
                                  )
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  onError(Failure error) {}

  @override
  onSuccess(result) {
    if (result != 'fetch') context.read<TodoViewModel>().init(this);
  }
}

class UpdateBottomSheet extends BaseStateFullWidget {
  final Function onTap;
  UpdateBottomSheet({super.key, required this.onTap});

  @override
  State<UpdateBottomSheet> createState() => _UpdateBottomSheetState();
}

class _UpdateBottomSheetState extends State<UpdateBottomSheet> {
  TextEditingController todoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Style.whiteColor,
        height: widget.dimens.k500,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.dimens.k30.verticalBoxPadding(),
            TextFormField(
              controller: todoController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                // labelText: AppStrings.passwordLabel,
                labelText: "todo",
                labelStyle: const TextStyle(color: Style.black),
                prefixIcon: const Icon(Icons.lock),
                border: const OutlineInputBorder(),
                enabledBorder: kOutlineInputBorder(color: Style.black),
                focusedBorder: kOutlineInputBorder(color: Style.black),
              ),
              validator: (password) {
                if (password == null || password.isEmpty) {
                  return 'Password field empty';
                }
                return null;
              },
            ),
            widget.dimens.k30.verticalBoxPadding(),
            BigBtn(
              radius: 12,
              color: Style.blueColor,
              onTap: () => widget.onTap(todoController.text.trim()),
              child: const Text(
                // AppStrings.loginButtonText.toUpperCase(),
                "Update",
                style: TextStyle(fontSize: 16, color: Style.whiteColor),
              ),
            )
          ],
        ),
      ),
    );
  }

  kOutlineInputBorder({Color? color}) =>
      OutlineInputBorder(borderSide: BorderSide(color: color ?? Style.black), borderRadius: BorderRadius.circular(widget.dimens.k15));
}
