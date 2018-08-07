/**
 * Created by Paul on 08/01/2018.
 */

class AppService {
  constructor() {
    console.log('app constructor');
  }

  getTwitterName(name) {
    if (name && name.startsWith('@')) {
      return name.slice(1)
    } else {
      return name;
    }
  }
}
