import 'package:equatable/equatable.dart';
import 'package:phal_flutter_todo_app/pages/home/home_page.dart';

class TabItemModel extends Equatable {
  const TabItemModel(this.label, this.icon, this.type);

  final String label;
  final String icon;
  final BottomTabType type;

  @override
  List<Object> get props => <Object>[
        label,
        icon,
        type,
      ];
}
