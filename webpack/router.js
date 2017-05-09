import React from 'react';
import { Route, Redirect } from 'react-router';
import createHistory from 'history/createBrowserHistory';
import {
  ConnectedRouter,
  routerMiddleware,
  routerReducer
} from 'react-router-redux';
import { current, constraintMonth } from './utils/calendar';
import App from './components/App';

export const history = createHistory({
  basename: '/dashboard'
});

export const middleware = routerMiddleware(history);
export const reducer = routerReducer;

class Routes extends React.Component{
  render(){
    const { dayBase } = this.props;
    return(
      <ConnectedRouter history={history}>
        <div>
          <Route
            path="/:year?/:month?"
            render={(props) => {
              const { match: { params: { year, month } } } = props;
              const appProps = { dayBase, year, month };

              if (year && month && !constraintMonth(year, month)) {
                return (<App {...appProps} />);
              }

              return (<Redirect to={'/'+current().format('YYYY/MM')} />);
            }}
          />

        </div>
      </ConnectedRouter>
    );
  }
}

export default Routes;
