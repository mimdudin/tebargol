import 'package:flutter/material.dart';

class DetailMatchPrediction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 12.0),
            child: Text(
              "Tebak Skor",
              style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 2.5),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 10.0),
                alignment: Alignment.center,
                height: 35.0,
                width: 100.0,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(50.0)),
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    "1",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 35.0,
                width: 100.0,
                decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(50.0)),
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    "X",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10.0),
                alignment: Alignment.center,
                height: 35.0,
                width: 100.0,
                decoration: BoxDecoration(
                    color: Colors.blue[800],
                    borderRadius: BorderRadius.circular(50.0)),
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    "2",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
