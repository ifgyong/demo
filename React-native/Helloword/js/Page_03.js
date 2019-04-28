import React, {Component} from 'react';
import {Platform, StyleSheet, Text, View,TouchableHighlight,Alert,Button,Image} from 'react-native';
import { createStackNavigator, createAppContainer } from 'react-navigation';
import { ScrollView } from 'react-native-gesture-handler';


export default class Page_03 extends React.Component {
  item(){
    var views = []
    for(var i=0;i < 4;i++) {
      views.push(
        <TouchableHighlight 
          onPress={()=>{
            Alert.alert('index:'+i+'😄');
        }
        }>
        <Image source ={require('../source/2.png')}
                    style={st.im}/> 
        </TouchableHighlight>
      )
    }
    return views;
  }

    render() {
      return (
        <View style={{ flex: 1, alignItems: 'center', justifyContent: 'center' }}>
          <Text>Image</Text>
          <Button
                      title="Go back"
                      onPress={() => this.props.navigation.goBack()}
                      />
                      <ScrollView pagingEnabled={true}>
                      {this.item()}
                      </ScrollView>
                   
        </View>
      )
    }

  }
  
  const st=StyleSheet.create({
    im:{flex:1,width:200,height:600,margin:10}
  })