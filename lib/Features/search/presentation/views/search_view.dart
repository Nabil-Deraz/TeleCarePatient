import 'package:flutter/material.dart';
import 'package:tecpatient/Features/search/models/hospitals_info.dart';
import 'package:tecpatient/Features/search/presentation/views/widgets/filter_search.dart';
import 'package:tecpatient/constants.dart';
import 'package:tecpatient/core/utils/styles.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});


  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  final searchController = TextEditingController();
  List<Hospitals> hospitals = allHospitals;

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          backgroundColor: kBackgroundColor,
          elevation: 0,
        ),
        body: Padding(padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hospitals' , style: Styles.Title20.copyWith(color: kDarkTitleColor),),
            const SizedBox(height: 10,),
            Row(
              children: [
                Container(
                  width: 286,
                  height: 58,
                  child: TextField(
                    controller: searchController,
                    style: TextStyle(color: kDarkTitleColor),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: kWhitecomp,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none
                     ),
                     hintText: "eg: Magdi Yacoub Heart Foundation",
                     hintStyle: TextStyle(color:Color(0xffCFCFCF)) ,
                     prefixIcon: Icon(Icons.search),
                     prefixIconColor: Color(0xff959595), 
                      ),
                      onChanged: searchedHospital,
                  ),
                ),
                const SizedBox(width: 20,),
                const filterSearch()
              ],
            ),
           const SizedBox(height: 20,),
           Expanded(
                  child: ListView.builder(
                    itemCount: hospitals.length,
                    itemBuilder: (context, index) { 
                      final hospitalInfo = hospitals[index];
                      
                      return ListTile(
                        leading: Image.network(
                          hospitalInfo.urlImage,
                          fit: BoxFit.fill,
                          width: 50,
                          height: 50,
                        ),
                        title: Text(hospitalInfo.name, style: Styles.Title12.copyWith(color: Color(0xff455A64)),),
                        subtitle: Text(hospitalInfo.city, style: Styles.Title11.copyWith(color: Color(0xffCFCFCF)),),
                        trailing: Text('4.8', style: Styles.Title11.copyWith(color: Colors.yellow,)
                      ));

                     },),
                ),
          ],
        ),
        ),
      ),

    );
   
    

  }
   void searchedHospital(String query){
        final suggestion = allHospitals.where((hospitalsInfo) {
          final hospitalName = hospitalsInfo.name.toLowerCase();
          final input = query.toLowerCase();

          return hospitalName.contains(input);
        }).toList();

        setState(() => hospitals = suggestion
          
        );

      }
}



