import 'package:flutter/material.dart';
import 'package:github_graphql_client/github_login.dart';
import 'package:github_graphql_client/github_oauth_credentials.dart';
import 'package:github_graphql_client/github_summary.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:window_to_front/window_to_front.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Github GraphQL API Client',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Github GraphQL API Client'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return GithubLoginWidget(
      builder: (context, httpClient) {
        WindowToFront.activate;
        final link = HttpLink(
          'https://api.github.com/graphql',
          httpClient: httpClient,
        );

        return Scaffold(
          appBar: AppBar(
            title: Text(
              title,
            ),
          ),
          body: GithubSummaryWidget(
            link: link,
          ),
        );
      },
      githubClientId: githubClientId,
      githubClientSecret: githubClientSecret,
      githubScopes: githubScopes,
    );
  }
}
