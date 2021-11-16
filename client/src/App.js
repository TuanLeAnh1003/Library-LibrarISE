import './App.css';
import { BrowserRouter as Router, Switch, Route } from 'react-router-dom';
import SignIn from './Pages/SignIn';
import WebSite from './Pages/WebSite';

function App() {
  return (
    <Router>
      <div className="app">
          <Switch>
            <Route exact path="/"><SignIn /></Route>
            <Route path="/thuvien"><WebSite /></Route>
          </Switch>
      </div>
  </Router>
  );
}

export default App;
