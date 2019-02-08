import axios from 'axios';

export default {
  fetchJobs: () => {
    console.log("REACT_APP_API_DOMAIN:" + process.env.REACT_APP_API_DOMAIN)
    console.log("REACT_APP_API_VERSION:" + process.env.REACT_APP_API_VERSION)
    return axios.get(process.env.REACT_APP_API_DOMAIN + process.env.REACT_APP_API_VERSION + '/dispatch.json', { crossdomain: true });
  },
  fetchAvailableTrucks: () => {
    return axios.get(process.env.REACT_APP_API_DOMAIN + process.env.REACT_APP_API_VERSION + '/trucks.json', { crossdomain: true });
  }
}