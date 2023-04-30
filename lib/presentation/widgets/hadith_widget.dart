import 'package:adhan_app/data/model/hadith_model.dart';
import 'package:flutter/material.dart';

class HadithWidget extends StatelessWidget {
  HadithWidget({Key? key, required this.hadithModel}) : super(key: key);
  final HadithModel hadithModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text('${hadithModel.number}'.toString()),
          const SizedBox(
            height: 10,
          ),
          Text('${hadithModel.arab}'.toString()),
        ],
      ),
    );
  }
}
