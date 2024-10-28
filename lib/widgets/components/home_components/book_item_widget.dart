import 'package:flutter/material.dart';

class BookItemWidget extends StatelessWidget {
  final String imageURL;
  final String titleBook;
  final String author;
  final String type;
  final int progress;

  const BookItemWidget(
      {super.key,
      required this.imageURL,
      required this.titleBook,
      required this.author,
      required this.progress,
      required this.type});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imageURL,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                textAlign: TextAlign.left,
                titleBook,
                style: textTheme.titleLarge!.copyWith(fontSize: 18),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                author,
                style: textTheme.bodySmall,
              ),
              const Spacer(),
              Row(
                children: [
                  const Icon(Icons.folder_outlined),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(type,style: textTheme.labelSmall,),
                  //Todo: Linear Progress Indicator
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
