import React, {useEffect, useState} from 'react';
import {
  NativeModules,
  Platform,
  SafeAreaView,
  StatusBar,
  useColorScheme,
  View,
  Text,
  TextInput,
  Button,
  StyleSheet,
} from 'react-native';

import {Colors} from 'react-native/Libraries/NewAppScreen';
import Config from 'react-native-config';
import {createBottomTabNavigator} from '@react-navigation/bottom-tabs';
import {NavigationContainer} from '@react-navigation/native';
import {enableScreens} from 'react-native-screens';

NativeModules.KlaviyoSDKBridge.initialize(Config.KLAVIYO_API_KEY);
enableScreens();

const Tab = createBottomTabNavigator();

//testing KlaviyoSDKBridge
console.log(NativeModules.KlaviyoSDKBridge);

const TabScreenOne = () => {
  const [email, setEmail] = useState(''); // State to hold email input

  useEffect(() => {
    // check to see what platform we are on
    if (Platform.OS === 'ios') {
      let properties = {
        'screen-viewed': 'Email Update',
      };
      NativeModules.KlaviyoSDKBridge.customEventWithNameAndProperties(
        'Viewed Screen:',
        properties,
      );
    }
  }, []);

  // Function to handle submission
  const handleSubmit = () => {
    // Simple validation check for email pattern
    const emailPattern = /\S+@\S+\.\S+/;
    if (!emailPattern.test(email)) {
      NativeModules.KlaviyoSDKBridge.showUIAlertController(
        'Error',
        'Invlid Email',
        'FIX',
      );
    } else {
      NativeModules.KlaviyoSDKBridge.setEmail(`${email}`);
      let properties = {
        'email-updated': `${email}`,
      };
      NativeModules.KlaviyoSDKBridge.customEventWithNameAndProperties(
        'Email Updated',
        properties,
      );
      NativeModules.KlaviyoSDKBridge.showUIAlertController(
        'Success',
        'Email Updated',
        'OK',
      );
      setEmail(''); // Clear the input
    }
  };

  const styles = StyleSheet.create({
    container: {
      flex: 1,
      justifyContent: 'center',
      padding: 20,
    },
    label: {
      fontSize: 20,
      marginBottom: 10,
    },
    input: {
      height: 40,
      borderColor: 'gray',
      borderWidth: 1,
      marginBottom: 20,
      padding: 10,
    },
  });

  return (
    <SafeAreaView style={styles.container}>
      <View>
        <Text style={styles.label}>Email:</Text>
        <TextInput
          style={styles.input}
          value={email}
          onChangeText={text => setEmail(text)} // Update email state when input changes
          placeholder="Enter your email"
          keyboardType="email-address"
          autoCapitalize="none"
        />
        <Button title="Submit" onPress={handleSubmit} />
      </View>
    </SafeAreaView>
  );
};

const TabScreenTwo = () => {
  const [phoneNumber, setPhoneNumber] = useState(''); // State to hold phone number input

  useEffect(() => {
    // check to see what platform we are on
    if (Platform.OS === 'ios') {
      let properties = {
        'screen-viewed': 'Update Phone Number',
      };
      NativeModules.KlaviyoSDKBridge.customEventWithNameAndProperties(
        'Viewed Screen:',
        properties,
      );
    }
  }, []);

  // Function to handle submission
  const handleSubmit = () => {
    // Simple validation check for phone number pattern
    const phoneNumberPattern = /^[0-9]+$/;
    if (!phoneNumberPattern.test(phoneNumber)) {
      NativeModules.KlaviyoSDKBridge.showUIAlertController(
        'Error',
        'Invalid Phone Number',
        'FIX',
      );
    } else {
      NativeModules.KlaviyoSDKBridge.setPhoneNumber(`${phoneNumber}`);
      let properties = {
        'phone-updated': `${phoneNumber}`,
      };
      NativeModules.KlaviyoSDKBridge.customEventWithNameAndProperties(
        'Phone Number Updated',
        properties,
      );
      NativeModules.KlaviyoSDKBridge.showUIAlertController(
        'Success',
        'Phone Number Updated',
        'OK',
      );
    }
  };

  return (
    <SafeAreaView style={styles.container}>
      <Text style={styles.label}>Phone Number:</Text>
      <TextInput
        style={styles.input}
        value={phoneNumber}
        onChangeText={text => setPhoneNumber(text)} // Update phone number state when input changes
        placeholder="Enter your phone number"
        keyboardType="phone-pad"
      />
      <Button title="Submit" onPress={handleSubmit} />
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    padding: 20,
  },
  label: {
    fontSize: 20,
    marginBottom: 10,
  },
  input: {
    height: 40,
    borderColor: 'gray',
    borderWidth: 1,
    marginBottom: 20,
    padding: 10,
  },
});

const App = (): JSX.Element => {
  useEffect(() => {
    // check to see what platform we are on
    if (Platform.OS === 'ios') {
      NativeModules.KlaviyoSDKBridge.customEventWithNameOnly(
        'Opened Application',
      );
    }
  }, []);

  const isDarkMode = useColorScheme() === 'dark';

  const backgroundStyle = {
    backgroundColor: isDarkMode ? Colors.darker : Colors.lighter,
  };

  return (
    <NavigationContainer>
      <StatusBar
        barStyle={isDarkMode ? 'light-content' : 'dark-content'}
        backgroundColor={backgroundStyle.backgroundColor}
      />
      <Tab.Navigator>
        <Tab.Screen name="Email" component={TabScreenOne} />
        <Tab.Screen name="Phone" component={TabScreenTwo} />
      </Tab.Navigator>
    </NavigationContainer>
  );
};

export default App;
