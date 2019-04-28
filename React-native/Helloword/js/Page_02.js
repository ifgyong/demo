import React, {Component} from 'react';
import {Platform, StyleSheet, Text, View,TouchableHighlight,Alert,Button,ScrollView} from 'react-native';
import { createStackNavigator, createAppContainer } from 'react-navigation';


export default class Page_02 extends React.Component {
    render() {
      return (
        <View style={{ flex: 1}}>
          <Text>Page_02</Text>
          <Button
                      title="Go back"
                      onPress={() => this.props.navigation.goBack()}
                      />
          <ScrollView style={{
                              
                            flexDirection: 'column',
                            backgroundColor:'#ECECEC',
                            margin:30,  
                            // height:300,    
                          }} 
                          pagingEnabled={true} 
                          showsHorizontalScrollIndicator={true}
                          // horizontal={true}
                          >
          <Text style={s.title}>总体竖直 </Text>
          <Text style={s.title}>第一行横 </Text>
                <View style={s.view_style_row}>
                  <View style={s.v_color_1} />
                  <View style={s.v_color_2} />
                  <View style={s.v_color_3} />
                </View>
                <Text style={s.title}>第三行竖 </Text>
                <View style={s.view_style_column}>
                  <View style={s.v_color_1} />
                  <View style={s.v_color_2} />
                  <View style={s.v_color_3} />
                </View>
                <Text style={s.title}>第三行横</Text>
                  <View style={s.view_style_row}>
                  <View style={s.v_color_1} />
                  <View style={s.v_color_2} />
                  <View style={s.v_color_3} />
                </View>
                
              {this.item()}

                
          </ScrollView>
        </View>
      );
    }
    item(){
      var views = []
      for(var i=0;i <20;i++) {
        views.push(
          <View >
              <Text style={s.title}>第{i+1}行横</Text>
              <View style={s.view_style_row}>
              <View style={s.v_color_1} />
              <View style={s.v_color_2} />
              <View style={s.v_color_3} />
              <View style={s.v_color_2} />
              
            </View>
         </View>
          
        )
      }
      return views;
    }
  }
 
  const s=StyleSheet.create({
    title:{
      fontSize:25,
      margin:10,
      fontWeight:'bold',
    },
    
    view_style_column:{flex: 1, flexDirection: 'column',margin:10},
    view_style_row:{flex: 1, flexDirection: 'row',margin:10},
    v_color_1:{width: 50, height: 50, backgroundColor: 'powderblue',margin:10},
    v_color_2:{width: 50, height: 50, backgroundColor: 'skyblue',margin:10},
    v_color_3:{width: 50, height: 50, backgroundColor: 'steelblue',margin:10},

  })