import 'package:bookapp/feature/presentation/viewmodel/FetchBestBook/fetch_best_box_cubit.dart';
import 'package:bookapp/feature/presentation/viewmodel/FetchBestBook/fetch_best_box_state.dart';
import 'package:bookapp/feature/presentation/viewmodel/fetch_newestbook_cubit.dart';
import 'package:bookapp/feature/presentation/viewmodel/fetch_newestbook_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomeScreen"),
      ),
      body: ListView(
        children: [
          BlocBuilder<FetchNewestbookCubit, FetchNewBookState>(
            builder: (context, state) {

              // if (state is FeaturedBooksSuccess) {
              //   return SizedBox(
              //     height: MediaQuery.of(context).size.height * .3,
              //     child: ListView.builder(
              //         physics: const BouncingScrollPhysics(),
              //         itemCount: state.books.length,
              //         scrollDirection: Axis.horizontal,
              //         itemBuilder: (context, index) {
              //           return Padding(
              //             padding: const EdgeInsets.symmetric(horizontal: 8),
              //             child: GestureDetector(
              //               onTap: () {
              //                 GoRouter.of(context).push(
              //                   AppRouter.kBookDetailsView,
              //                   extra: state.books[index],
              //                 );
              //               },
              //               child: CustomBookImage(
              //                 imageUrl: state.books[index].volumeInfo.imageLinks
              //                     ?.thumbnail ??
              //                     '',
              //               ),
              //             ),
              //           );
              //         }),
              //   );
              // } else if (state is FeaturedBooksFailure) {
              //   return CustomErrorWidget(errMessage: state.errMessage);
              // } else {
              //   return const CustomLoadingIndicator();
              // }

              if (state is FetchNewBookLoaded) {
                return ListView.builder(
                  shrinkWrap: true,
                   physics: BouncingScrollPhysics(),
                  itemCount: state.book.length,
                  itemBuilder: (context, index) {

              return     SizedBox(
                width: 100,
                child: CachedNetworkImage(
                       imageUrl: state.book[index].volumeInfo!.imageLinks!.thumbnail.toString(),
                       placeholder: (context, url) => CircularProgressIndicator(),
                       height: 200,
                       width: 120,
                       fit: BoxFit.fill,
                       errorWidget: (context, url, error) => Icon(Icons.error)
                     ),
              );
                  },);
              }
              else if (state is FetchNewBookError) {
                return Text(state.error.toString());
              }
              else {
    return Center(child: CircularProgressIndicator());
              }
            },)
        ],
      ),
    );
  }
}
