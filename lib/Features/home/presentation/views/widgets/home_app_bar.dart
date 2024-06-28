import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';
import 'package:tecpatient/constants.dart';
import 'package:tecpatient/core/local/cache_helper.dart';
import 'package:tecpatient/core/utils/styles.dart';

class HomeAppBar extends StatefulWidget {
  HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Text("Welcome Back", style: Styles.Title13),
                  Text(CacheHelper.getData(key: 'name'),
                      style: Styles.Title20.copyWith(color: kWhitecomp)),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(children: [
                      const Text(
                        "ID",
                        style: Styles.Title16,
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Text(CacheHelper.getData(key: 'regNum'),
                          style: Styles.Title16),
                    ]),
                  )
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 45),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          FontAwesomeIcons.magnifyingGlass,
                          size: 18,
                          color: kBackgroundColor,
                        )),
                    Stack(children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            FontAwesomeIcons.bell,
                            size: 18,
                            color: kBackgroundColor,
                          )),
                      Positioned(
                        top: 16,
                        left: 17,
                        child: Container(
                          width: 7,
                          height: 7,
                          decoration: const BoxDecoration(
                              color: Colors.red, shape: BoxShape.circle),
                        ),
                      )
                    ]),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          FontAwesomeIcons.bars,
                          size: 18,
                          color: kBackgroundColor,
                        ))
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 33.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              height: MediaQuery.of(context).size.height * .08,
              width: MediaQuery.of(context).size.width * .9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xffF0F4F7),
              ),
              child: SfBarcodeGenerator(
                value: CacheHelper.getData(key: 'regNum'),
                symbology: Code128C(),
                barColor: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
