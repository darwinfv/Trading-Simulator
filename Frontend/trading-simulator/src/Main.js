import React, { Component } from "react";
import "./App.css";
import axios from "axios";
import {
  Container,
  Row,
  Col,
  Collapse,
  Navbar,
  NavbarToggler,
  NavbarBrand,
  Nav,
  NavItem,
  NavLink,
  Card,
  Button,
  CardTitle,
  CardText,
  Form,
  FormGroup,
  Label,
  Input,
  FormText,
  InputGroup,
  InputGroupAddon,
  Table
} from "reactstrap";

axios.defaults.baseURL = "https://algotrader.herokuapp.com";

class Main extends Component {
  constructor(props) {
    super(props);
    console.log(props.match.params);
    let jwt = props.match.params.jwt;
    if (props.match.params.jwt == null || props.match.params.jwt == "") {
      jwt = "";
    }

    this.state = {
      collapsed: true,
      jwt: jwt,
      tableVals: []
    };
  }

  toggleNavbar = () => {
    this.setState({
      collapsed: !this.state.collapsed
    });
  };

  componentDidMount = () => {
    axios
      .post("/GET-LATEST-VALUE", {
        jwt: this.state.jwt
      })
      .then(response => {
        console.log(response.data);
        let values = [];
        for (let curr in response.data.currencies) {
          let changes = parseFloat(response.data.changes[curr] * 100).toFixed(
            2
          );
          let changeText = "";
          if (changes > 0) {
            changeText = <td className="text-success">{changes}%</td>;
          } else if (changes < 0) {
            changeText = <td className="text-danger">{changes}%</td>;
          } else {
            changeText = <td>--</td>;
          }
          let volatility = parseFloat(response.data.volatility[curr]).toFixed(
            2
          );
          let volatilityText = "";
          if (volatility > 0) {
            volatilityText = <td className="text-success">{volatility}%</td>;
          } else if (volatility < 0) {
            volatilityText = <td className="text-danger">{volatility}%</td>;
          } else {
            volatilityText = <td>--</td>;
          }
          let url;
          if (curr == "USD" || curr == "usd") {
            url = "USD";
          } else {
            url = <a href={"/AlgorithmicTradingSimulator/graphs/" + curr + "/" + this.state.jwt}>{curr}</a>;
          }
          values.push(
            <tr>
              <th scope="row">{url}</th>
              <td>{parseFloat(response.data.currencies[curr]).toFixed(2)}</td>
              {changeText}
              {volatilityText}
            </tr>
          );
        }
        this.setState({
          tableVals: values
        });
      })
      .catch(error => {
        console.log(error);
      });
  };

  render() {
    let nav;
    if (
      this.props.match.params.jwt == null ||
      this.props.match.params.jwt == ""
    ) {
      nav = (
        <Navbar color="dark" dark expand="md">
          <NavbarBrand href="/AlgorithmicTradingSimulator/" className="mr-auto">
            Algorithmic Trading Simulator
          </NavbarBrand>
          <NavbarToggler onClick={this.toggleNavbar} className="mr-2" />
          <Collapse isOpen={!this.state.collapsed} navbar>
            <Nav className="ml-auto" navbar>
              <NavItem>
                <NavLink href="/AlgorithmicTradingSimulator/">Home</NavLink>
              </NavItem>
              <NavItem>
                <NavLink href="/AlgorithmicTradingSimulator/login/">Login</NavLink>
              </NavItem>
              <NavItem>
                <NavLink href="/AlgorithmicTradingSimulator/register/">Register</NavLink>
              </NavItem>
            </Nav>
          </Collapse>
        </Navbar>
      );
    } else {
      nav = (
        <Navbar color="dark" dark expand="md">
          <NavbarBrand href={"/AlgorithmicTradingSimulator/home/" + this.state.jwt} className="mr-auto">
            Algorithmic Trading Simulator
          </NavbarBrand>
          <NavbarToggler onClick={this.toggleNavbar} className="mr-2" />
          <Collapse isOpen={!this.state.collapsed} navbar>
            <Nav className="ml-auto" navbar>
              <NavItem>
                <NavLink href={"/AlgorithmicTradingSimulator/home/" + this.state.jwt}>Home</NavLink>
              </NavItem>
              <NavItem>
                <NavLink href={"/AlgorithmicTradingSimulator/trading/" + this.state.jwt}>Trading</NavLink>
              </NavItem>
              <NavItem>
                <NavLink href={"/AlgorithmicTradingSimulator/profile/" + this.state.jwt}>Profile</NavLink>
              </NavItem>
              <NavItem>
                <NavLink href="/AlgorithmicTradingSimulator/logout/">Logout</NavLink>
              </NavItem>
            </Nav>
          </Collapse>
        </Navbar>
      );
    }

    return (
      <div>
        {nav}

        <Row
          style={{
            paddingLeft: "10vmin",
            paddingRight: "10vmin",
            paddingTop: "2vmin",
            paddingBottom: "5vmin"
          }}
        >
          <Col>
            <h3>CURRENCIES</h3>
            <Table bordered responsive style={{ marginTop: "2vmin" }}>
              <thead>
                <tr>
                  <th>Currencies</th>
                  <th>Value</th>
                  <th>Percent Change</th>
                  <th>Volatility</th>
                </tr>
              </thead>
              <tbody>{this.state.tableVals}</tbody>
            </Table>
          </Col>
        </Row>
      </div>
    );
  }
}

export default Main;
