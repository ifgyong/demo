import React, {Component} from 'react';
import {Platform, StyleSheet, Text, View,TouchableHighlight,Alert,Button,Animated} from 'react-native';
import { createStackNavigator, createAppContainer,NavigationActions } from 'react-navigation';
import FadeInView from '../js/FadeInView.js'
const navigateAction = NavigationActions.navigate({
  routeName: 'Page_05_p',

  params: {},

  action: NavigationActions.navigate({ routeName: 'Page_04_p' }),
});

export default class Page_04 extends React.Component {

    render() {
      return (
        <View style={{ flex: 1, alignItems: 'center', justifyContent: 'center' }}>
          <Text>Page_04</Text>
          <Button
                      title="Go back"
                      onPress={() => this.props.navigation.goBack()}
                      />
                      <Button
                      title="Push"
                      onPress={() => this.props.navigation.dispatch(navigateAction)}
                      />
          <FadeInView style={{width:200,height:50,backgroundColor:'powderblue'}}>
            <Text style={{fontSize:20,textAlign:'center',margin:10}}>Fading in </Text>
              {/* {this.props.children} */}
          </FadeInView>
        </View>
      );
    }
  }
  
  