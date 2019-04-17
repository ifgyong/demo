/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View,
  Button
} from 'react-native';
// import { createStackNavigator, createAppContainer } from 'react-navigation';


const instructions = Platform.select({
  ios: '第一个程序\n',
  android: '第一个程序\n',
});
class Label extends Component{
  render(){
    return (
    <View style = {{alignItems:'center'}}>
      <Text style = {styles.secondLine}>
      {this.props.name}
      </Text>
    </View>
    )
  }
}
class ShowLabel extends Component{
  render(){
    return(
    <View style={styles.container} >
      <Text style = {styles.firstLine}>
          我是第一行数据
        </Text>
        <Text style = {styles.secondLine}>
          我是第二行数据
        </Text>
        <Text>{this.name}</Text>
        <Label name="jeck"/>
        <Label name="Bob"/>
        <Label name="小明"/>
    </View>
    )
  }
}
export default class App extends Component<{}> {
  render() {
    let pic = {
      uri: 'https://upload.wikimedia.org/wikipedia/commons/d/de/Bananavarieties.jpg'
    };
    return (
      <View style={styles.container}>
      {/* <Image source ={pic} style={{{width: 100, height: 200}} /> */}
      {/* <ShowLabel name='小红' /> */}
        {/* <Button title="go to detial" onPress= {()=>this.props.navigation.navigate('Detail')}>
        </Button> */}
        
        <Text style={styles.instructions}>
          {instructions}
        </Text>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
    color:'#1e1e1e'
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
  firstLine:{
    fontSize: 13,
    color: 'red',
  },
  secondLine:{
    fontSize: 30,
    color: 'blue'
  }
});
