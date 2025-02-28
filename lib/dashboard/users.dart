part of 'dashboard_exports.dart';

class UserManagementScreen extends ConsumerWidget {
  const UserManagementScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool showClients = ref.watch(userTypeProvider) == UserType.client;
    return Scaffold(
      body: ref
          .watch(fetchUsersProvider)
          .when(
            data: (users) {
              final filteredUsers =
                  users
                      .where(
                        (user) =>
                            showClients
                                ? user is ClientModel
                                : user is AgentModel,
                      )
                      .toList();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Text("User Management", style: kTextStyle(25)),
                  UserTypeSegBttn(),
                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return SingleChildScrollView(
                          scrollDirection:
                              Axis.horizontal, // Allows horizontal scrolling if needed
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minWidth: constraints.maxWidth,
                            ),
                            child: DataTable(
                              showBottomBorder: true,
                              border: TableBorder.all(),
                              columns: [
                                DataColumn(
                                  label: Text(
                                    "Name",
                                    style: kTextStyle(18, isBold: true),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    "Email",
                                    style: kTextStyle(18, isBold: true),
                                  ),
                                ),
                                if (!showClients)
                                  DataColumn(
                                    label: Text(
                                      "Listings",
                                      style: kTextStyle(18, isBold: true),
                                    ),
                                  ), // Only show for agents
                              ],
                              rows:
                                  filteredUsers.map((user) {
                                    return DataRow(
                                      cells: [
                                        DataCell(Text(user.name)),
                                        DataCell(Text(user.email)),
                                        if (!showClients)
                                          DataCell(
                                            ref
                                                .watch(fetchListingsProvider)
                                                .when(
                                                  data: (listings) {
                                                    final agentListings =
                                                        listings
                                                            .where(
                                                              (listing) =>
                                                                  listing
                                                                      .agentID ==
                                                                  user.id,
                                                            )
                                                            .toList();
                                                    return Text(
                                                      agentListings.length
                                                          .toString(),
                                                    );
                                                  },
                                                  error: (e, stk) {
                                                    return Text('0');
                                                  },
                                                  loading: () {
                                                    return Text('...');
                                                  },
                                                ),
                                          ), // Show listing count for agents
                                      ],
                                    );
                                  }).toList(),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ).padX(5);
            },
            error: (e, stk) {
              return Center(child: Text("Error: $e"));
            },
            loading: () {
              return const Center(child: CircularProgressIndicator());
            },
          ),
    );
  }
}
