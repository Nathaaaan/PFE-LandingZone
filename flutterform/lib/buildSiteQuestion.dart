import 'package:flutter/material.dart';

class buildSiteQuestion extends StatefulWidget {
  String nbUsers = '';
  String goal = '';
  String target = '';
  String international = '';
  String response = '';
  String maintenance = '';

  final Function callbackUsers;
  final Function callbackGoal;
  final Function callbackTarget;
  final Function callbackInter;
  final Function callbackResponse;
  final Function callbackMaintenance;

  buildSiteQuestion({Key? key, required this.nbUsers, required this.goal, required this.target, required this.international, required this.response, required this.maintenance, required this.callbackUsers, required this.callbackGoal, required this.callbackTarget, required this.callbackInter, required this.callbackResponse, required this.callbackMaintenance}) : super(key: key);

  @override
  _buildSiteQuestionState createState() => _buildSiteQuestionState();
}

class _buildSiteQuestionState extends State<buildSiteQuestion> {
  final List<String> users = ['10','50','100','150'];
  final List<String> listgoal = ['Ecommerce','Site vitrine','site à force audience'];
  final List<String> listtarget = ['BToB','BToC'];
  final List<String> listmaintenance = ['Interne','Externe'];
  final List<bool> selectedInter = [true,false];
  final List<bool> selectedResp = [true,false];
  final List<String> choice = ['Oui','Non'];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Nombres d'utilisateurs?",
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height:20),
          DropdownButtonFormField<String>(
          decoration: InputDecoration.collapsed(hintText: widget.nbUsers),
          onChanged: (String? newValue) {
            setState(() {
              widget.nbUsers = newValue!;
              widget.callbackUsers(widget.nbUsers);
            });
          },
          validator: (value) {
            if (value == null) {
              return 'champs requis';
            }
            return null;
          },
          items: users.map((user){
            return DropdownMenuItem(
              value: user,
              child: Text(user),
            );
          }).toList(),
          ),
          SizedBox(height: 20),
          Text(
            "Quelle est le but de votre site?",
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          DropdownButtonFormField<String>(
            decoration: InputDecoration.collapsed(hintText: widget.goal),
            onChanged: (String? newValue) {
              setState(() {
                widget.goal = newValue!;
                widget.callbackGoal(widget.goal);
              });
            },
            validator: (value) {
              if (value == null) {
                return 'champs requis';
              }
              return null;
            },
            items: listgoal.map((goals){
              return DropdownMenuItem(
                value: goals,
                child: Text(goals),
              );
            }).toList(),
          ),
          SizedBox(height: 20),
          Text(
            "Quelles sont les cibles de votre site?",
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          DropdownButtonFormField<String>(
            decoration: InputDecoration.collapsed(hintText: widget.target),
            onChanged: (String? newValue) {
              setState(() {
                widget.target = newValue!;
                widget.callbackTarget(widget.target);
              });
            },
            validator: (value) {
              if (value == null) {
                return 'champs requis';
              }
              return null;
            },
            items: listtarget.map((targets){
              return DropdownMenuItem(
                value: targets,
                child: Text(targets),
              );
            }).toList(),
          ),
          SizedBox(height: 20),
          Text(
            "Souhaitez-vous une visibilité internationale de votre site?",
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          ToggleButtons(
            isSelected: selectedInter,
            fillColor: Color.fromRGBO(123,44,191,1.0),
            selectedColor: Colors.white,
            renderBorder: false,
            borderRadius: BorderRadius.circular(30),
            children: <Widget>[
              Text(
                choice[0],
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize:15,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text(
                choice[1],
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize:15,
                    fontWeight: FontWeight.bold
                ),
              ),
            ],
            onPressed: (int newIndex) {
              setState(() {
                for (int index = 0; index < selectedInter.length; index++){
                  if(index == newIndex) {
                    selectedInter[index] = true;
                    widget.international = choice[index];
                    widget.callbackInter(widget.international);
                  } else {
                    selectedInter[index] = false;
                  }
                }
              });
            },
          ),
          SizedBox(height: 20),
          Text(
            "Avez-vous besoin d'un temps de réponse rapide à l'étranger?",
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          ToggleButtons(
            isSelected: selectedResp,
            fillColor: Color.fromRGBO(123,44,191,1.0),
            selectedColor: Colors.white,
            renderBorder: false,
            borderRadius: BorderRadius.circular(30),
            children: <Widget>[
              Text(
                choice[0],
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize:15,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text(
                choice[1],
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize:15,
                    fontWeight: FontWeight.bold
                ),
              ),
            ],
            onPressed: (int newIndex) {
              setState(() {
                for (int index = 0; index < selectedResp.length; index++){
                  if(index == newIndex) {
                    selectedResp[index] = true;
                    widget.response = choice[index];
                    widget.callbackResponse(widget.response);
                  } else {
                    selectedResp[index] = false;
                  }
                }
              });
            },
          ),
          SizedBox(height: 20),
          Text(
            "Préférez-vous une création et une maintenance de votre site en interne ou en externe?",
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          DropdownButtonFormField<String>(
            decoration: InputDecoration.collapsed(hintText: widget.maintenance),
            onChanged: (String? newValue) {
              setState(() {
                widget.maintenance = newValue!;
                widget.callbackMaintenance(widget.maintenance);
              });
            },
            validator: (value) {
              if (value == null) {
                return 'champs requis';
              }
              return null;
            },
            items: listmaintenance.map((element){
              return DropdownMenuItem(
                value: element,
                child: Text(element),
              );
            }).toList(),
          ),

        ],
      ),
    );
  }
}
