part of 'dashboard_exports.dart';

class UserManagementScreen extends ConsumerWidget {
  bool? isFullScreen;
  UserManagementScreen({this.isFullScreen, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool showClients = ref.watch(userTypeProvider) == UserType.client;
    return ref
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
                Row(
                  children: [
                    Text(
                      "HomeQuest users",
                      style: kTextStyle(25, isBold: true),
                    ),
                  ],
                ),
                UserTypeSegBttn(),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Scrollbar(
                        thumbVisibility: true,
                        trackVisibility: true,
                        child: SingleChildScrollView(
                          scrollDirection:
                              Axis.horizontal, // Allows horizontal scrolling if needed
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minWidth:
                                  context.screenWidth < 900
                                      ? context.screenWidth * .8
                                      : context.screenWidth * .6,
                            ),
                            child: DataTable(
                              showBottomBorder: true,
                              border: TableBorder.all(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              columns: [
                                DataColumn(label: Text("S/N")),
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
                                  ),
                                DataColumn(
                                  label: Text(
                                    "Action",
                                    style: kTextStyle(18, isBold: true),
                                  ),
                                ),
                              ],
                              rows:
                                  filteredUsers.map((user) {
                                    return DataRow(
                                      cells: [
                                        DataCell(
                                          Text(
                                            (filteredUsers.indexOf(user) + 1)
                                                .toString(),
                                          ),
                                        ),
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
                                          ),
                                        DataCell(
                                          IconButton(
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    title: Text("Delete user"),
                                                    content: Text(
                                                      "Do you want to delete this user from the database",
                                                    ),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () {
                                                          showClients
                                                              ? ref.read(
                                                                deleteClientProvider(
                                                                  user.id,
                                                                ),
                                                              )
                                                              : ref.read(
                                                                deleteAgentProvider(
                                                                  user.id,
                                                                ),
                                                              );

                                                          ref.invalidate(
                                                            fetchUsersProvider,
                                                          );
                                                        },
                                                        child: Text("Yes"),
                                                      ),
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.of(
                                                            context,
                                                          ).pop();
                                                        },
                                                        child: Text("No"),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                            icon: Icon(Icons.delete),
                                          ),
                                        ),
                                      ],
                                    );
                                  }).toList(),
                            ),
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
        );
  }
}
