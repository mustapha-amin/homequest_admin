import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homequest_admin/core/enums.dart';
import 'package:homequest_admin/core/extensions.dart';
import 'package:homequest_admin/core/utils/textstyle.dart';

final userTypeProvider = StateProvider((ref) {
  return UserType.client;
});

class UserTypeSegBttn extends ConsumerWidget {
  const UserTypeSegBttn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: Color(0xFFF6F6F6),
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                ref.read(userTypeProvider.notifier).state = UserType.client;
              },
              child: Card(
                elevation:
                    ref.watch(userTypeProvider) == UserType.client ? 1 : 0,
                color:
                    ref.watch(userTypeProvider) == UserType.client
                        ? const Color(0xFFFFF7E2)
                        : const Color(0xFFF6F6F6),
                shape: RoundedRectangleBorder(
                  side:
                      ref.watch(userTypeProvider) == UserType.client
                          ? const BorderSide(width: 1)
                          : BorderSide.none,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SizedBox(
                  height: 40,
                  child: Center(child: Text("Clients", style: kTextStyle(12))),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                ref.read(userTypeProvider.notifier).state = UserType.agent;
              },
              child: Card(
                elevation:
                    ref.watch(userTypeProvider) == UserType.client ? 0 : 1,
                color:
                    ref.watch(userTypeProvider) == UserType.agent
                        ? const Color(0xFFFFF7E2)
                        : const Color(0xFFF6F6F6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side:
                      ref.watch(userTypeProvider) == UserType.agent
                          ? const BorderSide(width: 1)
                          : BorderSide.none,
                ),
                child: SizedBox(
                  height: 40,
                  child: Center(child: Text("Agents", style: kTextStyle(12))),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
