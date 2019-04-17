/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, {Component} from 'react';
import {
  Platform, StyleSheet, Text, View,TextInput,
  AppRegistry,Button,Alert,ScrollView,
  FlatList,SectionList,

} from 'react-native';

const instructions = Platform.select({
  ios: 'iOS哦',
  android:
    '这是安卓'
});
class Blink extends Component{
  constructor(props){
    super(props);
    this.state = {isShowText: true};
    setInterval(()=>{
      this.setState(previouState =>{return {isShowText:!previouState.isShowText}});
    },1000);
  }
  render(){
    if (!this.state.isShowText){
      return null;
  }
    return(
    <Text style = {styles.red}>{this.props.text}</Text>
  )}
}
type Props = {};
export default class App extends Component<Props> {
  constructor(props){
    super(props);
    this.state={text:''};
  }
  _onPressButton(){
    Alert.alert('title');
  }
  render() {
    return (
      <View style={styles.container}>
       <Text>哈哈我来咯3</Text>
        <Text style={styles.instructions}>{instructions}</Text>
        {/* <Blink text='i lob s'></Blink>
        <Blink text='111111111111'></Blink>

        <Blink text='这是一个新的line'></Blink> */}
        <ScrollView style={{width:100}}>
        <Button onPress={this._onPressButton} title='push me'></Button>
        <View style = {{width:50,height:50,backgroundColor:'powderblue'}}></View>
      <View style = {{width:50,height:50,backgroundColor:'skyblue'}}></View>
      <View style = {{width:50,height:50,backgroundColor:'steelblue'}}></View>
      <TextInput style={{height:40}} 
      placeholder='输入名字' 
      onChangeText={(text) => this.setState(
        {text}
        )}/>
      <Text style={{padding:10,fontSize:32}}>
        {this.state.text}
      </Text>
        </ScrollView>
        <FlatList data={[
          '1','2','3','4','5','6','7','8','9','1','0'
        ]} 
        renderItem = {
          ({item}) =>
           <Text>
            {item}
          </Text>
        }/>


        <SectionList sections={
          [
            {title:'D',data :['lov','fu','12']},
            {title:'j',data :['I','u']}
          ]
        }
        renderItem = {<
          ({item}) =>
        <Text>{item}</Text>
      }
      renderSectionHeader = {
        ({section})=>{
          
          
             {/* <Text>
             {section.title},label
           </Text> */}
          <Button onPress={()=>{
            Alert.alert('alert');
          }} 
            color='#841584'
            title={section.title}>
          </Button>

          
        }
      } 
      keyExtractor = {(item,index)=>index} 
      />


        
      </View>
      
    );
  }
}

const styles = StyleSheet.create({
  red:{
    fontSize:30,
    color:"red"
  } ,
  container: {
    flex: 1,
    flexDirection:'column',
    // justifyContent:'space-between',
    justifyContent: 'space-between',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});
