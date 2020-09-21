
import 'package:flutter/material.dart';

import 'subject_content.dart';

class HYSubjectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("书音影"),
      ),
      body: HYSubjectContent(),
    );
  }
}
